import {PrismaClient} from '@prisma/client'

const prisma = new PrismaClient()

const main = async () => {
    await prisma.users.create({
        data: {
            email: 'wilitopruebas@gmail.com',
            name: 'wilito',
            lastname: 'flores',
            phone: '04143015802',
            password: 'password',
        }
    })
    console.log('Seed Exitoso')
}

main()