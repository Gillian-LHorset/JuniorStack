-- CreateTable
CREATE TABLE "t_categorie" (
    "cate_id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_categorie_pkey" PRIMARY KEY ("cate_id")
);

-- CreateTable
CREATE TABLE "t_competence" (
    "comp_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_competence_pkey" PRIMARY KEY ("comp_id")
);

-- CreateTable
CREATE TABLE "t_devlopper_profile" (
    "dev_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "categorie_fk" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_devlopper_profile_pkey" PRIMARY KEY ("dev_id")
);

-- CreateTable
CREATE TABLE "t_company_profile" (
    "company_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_company_profile_pkey" PRIMARY KEY ("company_id")
);

-- CreateTable
CREATE TABLE "t_projet" (
    "projet_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "categorie_fk" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t_projet_pkey" PRIMARY KEY ("projet_id")
);

-- CreateTable
CREATE TABLE "_CompetenceToDevlopperProfile" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_CompetenceToDevlopperProfile_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_CompetenceToProjet" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_CompetenceToProjet_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_CompetenceToDevlopperProfile_B_index" ON "_CompetenceToDevlopperProfile"("B");

-- CreateIndex
CREATE INDEX "_CompetenceToProjet_B_index" ON "_CompetenceToProjet"("B");

-- AddForeignKey
ALTER TABLE "t_devlopper_profile" ADD CONSTRAINT "t_devlopper_profile_categorie_fk_fkey" FOREIGN KEY ("categorie_fk") REFERENCES "t_categorie"("cate_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "t_projet" ADD CONSTRAINT "t_projet_categorie_fk_fkey" FOREIGN KEY ("categorie_fk") REFERENCES "t_categorie"("cate_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetenceToDevlopperProfile" ADD CONSTRAINT "_CompetenceToDevlopperProfile_A_fkey" FOREIGN KEY ("A") REFERENCES "t_competence"("comp_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetenceToDevlopperProfile" ADD CONSTRAINT "_CompetenceToDevlopperProfile_B_fkey" FOREIGN KEY ("B") REFERENCES "t_devlopper_profile"("dev_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetenceToProjet" ADD CONSTRAINT "_CompetenceToProjet_A_fkey" FOREIGN KEY ("A") REFERENCES "t_competence"("comp_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetenceToProjet" ADD CONSTRAINT "_CompetenceToProjet_B_fkey" FOREIGN KEY ("B") REFERENCES "t_projet"("projet_id") ON DELETE CASCADE ON UPDATE CASCADE;
