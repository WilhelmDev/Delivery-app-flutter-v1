import { Request, Response } from "express";
import {PrismaClient} from '@prisma/client'
import { FlutterRegister, LoginData } from "../interfaces/user.interface";
import { comparePassword, genJWT, hashPassword } from "../helpers";

const prisma = new PrismaClient()

export const getUsers = async (req:Request, res:Response) => {
    try {
        const users = await prisma.users.findMany({
            take:1, 
            include: {
                rolOnUser: {
                    include: {
                        rol: true
                    }
                }
            },
        })
        let newU = users.map(user => {
            const {createdAt, updatedAt, rolOnUser, ...mapUser} = user
            const mapRol = rolOnUser.map(item => {
                const {assignedAt, userId, rolId, ...mapedR} = item
                const {createdAt, updatedAt, ...rol} = mapedR.rol
                return rol
            })
            return {
                ...mapUser,
                roles: mapRol
            }
        })
        return res.status(200).json({success:true, message: 'Respuesta correcta', data: newU})
    } catch (error) {
        console.log(error)
        return res.status(500).json({success:false, message: error})
    }
}

export const registerUser = async (req:Request, res:Response) => {
    try {
        const {id, ...userData} = req.body as FlutterRegister
        userData.password = await hashPassword(userData.password)
        const newUser = await prisma.users.create({
            data: userData
        })
        await prisma.rolOnUser.create({
            data: {
                userId: newUser.id,
                rolId: 1
            }
        })
        return res.status(201).json({success:true, message: 'Usuario Creado correctamente, ahora inicie sesion', data: newUser})
    } catch (error) {
        console.log(error)
        return res.status(500).json({success:false, message: 'Ocurrio un error', error: error})
    }
}
export const loginUser = async (req:Request, res:Response) => {
    const {email, password:passLog} = req.body as LoginData
    try {
        const user = await prisma.users.findUnique({
            where: {
                email
            },
            select: {
                password:true,
                id: true
            }
        })
        if (user !== null) {
            const {password, id} = user
            const passIsOk = await comparePassword(passLog, password)
            if (!passIsOk) {
                return res.status(401).json({success:false, message: 'Contraseña incorrecta'})
            }
            const userWithJwt = await prisma.users.update({
                where: {
                    id
                },
                data: {
                    session_token: genJWT(id, email)
                },
                include: {
                    rolOnUser : {
                        include: {
                            rol: true
                        }
                    }
                }
            })
            const {createdAt, updatedAt, rolOnUser, ...parsedUser} = userWithJwt
            const parsedRol = rolOnUser.map((rol) => {
                const {assignedAt, userId, rolId, ...mapedR} = rol
                const {createdAt, updatedAt, ...parsed} = mapedR.rol
                return parsed
            })
            const parsedInfo = {
                ...parsedUser,
                roles: parsedRol
            }
            return res.status(201).json({success: true, message: 'Inico de sesión correcto', data: parsedInfo})
        }
        return res.status(404).json({success:false, message: 'El email no está registrado'})
    } catch (error) {
        return res.status(500).json({success:false, message: 'Ocurrio un error', error: error})
    }
}