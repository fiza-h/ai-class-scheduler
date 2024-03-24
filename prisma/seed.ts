import { PrismaClient } from '@prisma/client'
import fs from 'fs'
import csvParser from 'csv-parser'

const prisma = new PrismaClient()

async function main() {
  // Read the CSV file and parse each line
  fs.createReadStream('prisma/schedule-formatted.csv')
    .pipe(csvParser())
    .on('data', async (row) => {
      try {
        // Extract data from the CSV row
        console.log(row)
        const { class_id, course, teacher, program, lecDay, lecTime, labDay, labTime } = row
        console.log(class_id)
        console.log(course)
        console.log(teacher)
        
        // Save the data into the database using Prisma
        await prisma.class.create({
          data: {
            class_id: parseInt(class_id),
            course: {
                connectOrCreate: {
                  where: { course_id: parseInt(course) },
                  create: {
                    course_id: parseInt(course),
                    course_name: mapIDtoCourse(course)
                  }
                }
              },
            teacher,
            program,
            lecDay: parseInt(lecDay),
            lecTime: parseInt(lecTime),
            labDay: parseInt(labDay),
            labTime: parseInt(labTime)
          }
        })
        
        console.log(`Class with class_code ${class_id} saved to the database`)
      } catch (error) {
        console.error('Error saving class to the database:', error)
      }
    })
    .on('end', async () => {
      console.log('CSV file processed')
      await prisma.$disconnect()
    })
}

// Function to map course ID to course name
function mapIDtoCourse(courseId: string): string {
    // Convert courseId to integer
    const id = parseInt(courseId)
  
    // Map course ID to course name
    switch (id) {
        case 0:
            return 'CAAL'
        case 1:
            return 'IST'
        case 2:
            return 'CCN'
        case 3:
            return 'AI'
        case 4:
            return 'TOA'
        default:
            return 'Unknown'
    }
  }
  

main()
  .catch(async (error) => {
    console.error('Error processing CSV file:', error)
    await prisma.$disconnect()
    process.exit(1)
  })
