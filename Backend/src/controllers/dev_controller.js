import { prisma } from "../db.ts";

export const developerProfileController = {
  index() {
    let devP = prisma.devlopperProfile.findMany({
      include: { categorie: true, competences: true },
    });
    console.log(devP);
  },

  getNames() {
    return prisma.devlopperProfile.findMany({
      select: { name: true },
    });
  },
};
