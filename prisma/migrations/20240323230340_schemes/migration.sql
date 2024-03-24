-- CreateTable
CREATE TABLE "Class" (
    "class_id" INTEGER NOT NULL,
    "teacher" TEXT NOT NULL,
    "program" TEXT NOT NULL,
    "lecDay" INTEGER NOT NULL,
    "lecTime" INTEGER NOT NULL,
    "labDay" INTEGER NOT NULL,
    "labTime" INTEGER NOT NULL,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("class_id")
);

-- CreateTable
CREATE TABLE "Course" (
    "course_id" INTEGER NOT NULL,
    "course_name" TEXT NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("course_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Class_class_id_key" ON "Class"("class_id");

-- CreateIndex
CREATE UNIQUE INDEX "Course_course_id_key" ON "Course"("course_id");

-- AddForeignKey
ALTER TABLE "Class" ADD CONSTRAINT "Class_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "Course"("course_id") ON DELETE RESTRICT ON UPDATE CASCADE;
