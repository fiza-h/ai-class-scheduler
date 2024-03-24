/*
  Warnings:

  - You are about to drop the column `course` on the `Class` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Class" DROP COLUMN "course";

-- CreateTable
CREATE TABLE "Course" (
    "course_id" INTEGER NOT NULL,
    "course_name" TEXT NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("course_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Course_course_id_key" ON "Course"("course_id");

-- AddForeignKey
ALTER TABLE "Class" ADD CONSTRAINT "Class_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "Course"("course_id") ON DELETE RESTRICT ON UPDATE CASCADE;
