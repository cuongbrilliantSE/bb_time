"use strict";

/**
 * post-category controller
 */

const { createCoreController } = require("@strapi/strapi").factories;

module.exports = createCoreController("api::post-category.post-category", {
  async countPost(ctx) {
    var { query } = ctx.request;
    return await strapi.entityService.findMany(
      "api::post-category.post-category",
      {
        fields: ["slug", "title"],
        populate: {
          posts: { count: true },
        },
      }
    );
  },
});
