const router = require("express").Router();
const { Category, Product } = require("../../models");

// The `/api/categories` endpoint

router.get("/", async (req, res) => {
  // find all categories
  // be sure to include its associated Products
  try {
    const categories = await Category.findAll({
      include: [Product],
    });
    res.status(200).json(categories);
  } catch (err) {
    console.log(err);
    res.status(500).json(err);
  }
});

router.get("/:id", async (req, res) => {
  // find one category by its `id` value
  // be sure to include its associated Products
  try {
    const category = await Category.findByPk(req.params.id, {
        include: [{model: Product}]
    });
    if (!category) {
        res.status(404).json({message: "no categories with the specified id exist in the database"});
        return;
    }
    res.status(200).json(category);
  } catch (err) {
    res.status(500).json(err);
  }
});

router.post("/", async (req, res) => {
  // create a new category
  try {
      console.log(req.body);
      const newCategory = await Category.create(req.body);
      res.status(200).json(newCategory);
  } catch (err) {
      res.status(400).json(err);
  }
});

router.put("/:id", async (req, res) => {
  // update a category by its `id` value
  try {
      const categoryData = await Category.update(req.body, {
          where: {
              id: req.params.id
          }
      });
      if (!categoryData) {
          res.status(400).json({ message: "Update failed: no category with the specified id was found" });
          return;
      }
      res.status(200).json(categoryData);
    } catch (err) {
        res.status(500).json(err);
    }
});

router.delete("/:id", async (req, res) => {
  // delete a category by its `id` value
  try {
      const delCategory = await Category.destroy({
          where: {
              id: req.params.id
          }
        });
        if (!delCategory) {
            res.status(400).json({ message: "Delete failed: no category with the specified id was found" });
            return;
        }
        res.status(200).json(delCategory);
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = router;
