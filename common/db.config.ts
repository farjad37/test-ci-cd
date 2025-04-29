import { PrismaClient } from '@prisma/client';

const db = new PrismaClient({
  log: [
    {
      emit: 'event',
      level: 'query',
    },
    {
      emit: 'stdout',
      level: 'error',
    },
  ],
});

//   db.$on("query", async (e) => {
//    console.log(`${e.query} ${e.params}`)
// });

export { db };
