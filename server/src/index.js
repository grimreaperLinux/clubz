const express = require('express')
const userRouter = require('./routers/user')
const app = express()
require('./db/mongodb')
const port = process.env.PORT || 3000

app.use(express.json())
app.use(userRouter)


app.listen(port, () => {
    console.log('Server is up and running ' +port)
})
