import { Router } from "express";
import * as controller from "../controllers/index.js";

const router = Router();

router.get("/", (req, res) => {
  res.redirect("/basic");
});
router.get("/basic", controller.basic);
router.get("/genres", controller.genre);
router.get("/miscellaneous", controller.misc);
router.get("/box-office", controller.boxOffice);
router.get("/trends", controller.trends);
router.get("/recency", controller.recency);

export default router;
