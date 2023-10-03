import express from 'express'
import cors from 'cors'
import userRoutes from './routes/users.routes'

const app = express()
app.use(express.json())
app.use(cors())

const PORT = process.env.PORT || 3000

app.use('/api/users', userRoutes)

app.listen(PORT, () => {
    console.log(`server running in port ${PORT}`)
})
