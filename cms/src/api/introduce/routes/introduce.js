'use strict';

/**
 * introduce router
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::introduce.introduce');
