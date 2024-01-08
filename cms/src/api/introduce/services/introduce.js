'use strict';

/**
 * introduce service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::introduce.introduce');
