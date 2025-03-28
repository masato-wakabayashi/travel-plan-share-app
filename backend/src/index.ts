import express from 'express';
import cors from 'cors';
import loginRouter from './routes/login';

const app = express();
const PORT = process.env.PORT;

app.use(cors());

// ルーティング
app.use('/login', loginRouter);

app.get("/", (req, res) => {
  res.send("travel-share-app");
})

app.listen(PORT, () => {
  console.log(`🚀 Server is running on http://localhost:${PORT}`);
});
