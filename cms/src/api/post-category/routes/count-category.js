module.exports = {
  routes: [
    {
      // Path defined with a URL parameter
      method: "GET",
      path: "/post-category/count-post",
      handler: "post-category.countPost",
    },
  ],
};
