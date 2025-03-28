import express from 'express';
import dotenv from 'dotenv';
import { PrismaClient } from '@prisma/client';

const router = express.Router();
const prisma = new PrismaClient();
dotenv.config();

router.get("/", (req, res) => {
    // const { username, password } = req.body;

    // 仮の処理
    res.status(200).json({ message: "ログイン処理実行" });
})

export default router;

