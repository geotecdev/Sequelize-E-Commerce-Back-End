const router = require('express').Router();
const { Tag, Product, ProductTag } = require('../../models');

// The `/api/tags` endpoint

router.get('/', async (req, res) => {
    // find all tags
    // be sure to include its associated Product data
    try {
    const tags = await Tag.findAll({
        include: [{ model: Product }, { model: Tag, through: ProductTag }],
    });
    res.status(200).json(tags);
    } catch (error) {
        res.status(500).json(err);
    }
});

router.get('/:id', async (req, res) => {
    // find a single tag by its `id`
    // be sure to include its associated Product data
    try {
        const tag = Tag.findByPk(req.params.id, {
            include: [{ model: Product }, { model: Tag, through: ProductTag }],
        });
        if (!tag) {
            res.status(400).json({ message: "no tags with the specified id exist in the database" });
            return;
        }
        res.status(200).json(tag);
    } catch (err) {
        res.status(500).json(err);
    }
});

router.post('/', async (req, res) => {
  // create a new tag
  try {
      const newTag = await Tag.create(req.body);
      res.status(200).json(newTag);
  } catch (err) {
      res.status(500).json(err);
  }
});

router.put('/:id', async (req, res) => {
    // update a tag's name by its `id` value
    try {
        const tagData = await Tag.update(req.body, {
            where: {
                id: req.params.id
            }
        });
        if (!tagData) {
            res.status(400).json({ message: "Update failed: no tag with the specified id was found" });
            return;
        }
        res.status(200).json(tagData);
    } catch (err) {
        res.status(500).json(err);
    }

});

router.delete('/:id', async (req, res) => {
  // delete on tag by its `id` value
    try {
        const delTag = await Tag.destroy({
            where: {
                id: req.params.id
            }
        });
        if (!delTag) {
            res.status(404).json({ message: "Delete failed: no tag with the specified id was found" });
            return;
        }
        res.status(200).json(delTag);
    } catch (err) {
        res.status(500).json(err);
    }
});

module.exports = router;