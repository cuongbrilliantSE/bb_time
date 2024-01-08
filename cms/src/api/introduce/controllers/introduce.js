'use strict';

/**
 * introduce controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::introduce.introduce');
