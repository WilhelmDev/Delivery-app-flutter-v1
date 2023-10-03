import express from 'express'
import { getUsers, loginUser, registerUser } from '../controllers/users.controller'

const router = express.Router()

router.get('/all', getUsers)
router.post('/register', registerUser)
router.post('/login', loginUser)
export default router