/*
  Warnings:

  - You are about to drop the `Course` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `course` to the `Class` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Class" DROP CONSTRAINT "Class_class_id_fkey";

-- AlterTable
ALTER TABLE "Class" ADD COLUMN     "course" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Course";
