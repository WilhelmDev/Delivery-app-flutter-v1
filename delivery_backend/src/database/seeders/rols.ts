import {PrismaClient} from '@prisma/client'

const prisma = new PrismaClient()

const main = async () => {
    await prisma.rols.createMany({
        data: [
            {
                name: 'CLIENTE',
                route: 'client/products/list'
            },
            {
                name: 'RESTAURANTE',
                route: 'restaurant/orders/list'
            },
            {
                name: 'REPARTIDOR',
                route: 'delivery/orders/list'
            },
        ]
    })
    console.log('Seed Exitoso de roles')
}

main()