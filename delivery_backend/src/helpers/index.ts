import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'

export const hashPassword = async (password:string) => {
    const salt = await bcrypt.genSalt(10) 
    const newPassword = await bcrypt.hash(password, salt)
    return newPassword
}

export const comparePassword = async ( password: string, dbPass:string) => {
    return await bcrypt.compare(password, dbPass)
}

export const genJWT = (id:number, email:string) => {
    return jwt.sign({id, email}, process.env.JWT_SECRET as string, { //secret word of jwt
        expiresIn:"2d"
    })
}
