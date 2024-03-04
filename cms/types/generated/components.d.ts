import type { Schema, Attribute } from '@strapi/strapi';

export interface HomeAdvantage extends Schema.Component {
  collectionName: 'components_home_advantages';
  info: {
    displayName: 'Advantage';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    image: Attribute.Media & Attribute.Required;
    subject: Attribute.String;
    post: Attribute.Relation<'home.advantage', 'oneToOne', 'api::post.post'>;
  };
}

export interface HomeDomain extends Schema.Component {
  collectionName: 'components_home_domains';
  info: {
    displayName: 'Category';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    icon: Attribute.Media & Attribute.Required;
    content_html: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'rich';
        }
      >;
  };
}

export interface HomeHomePost extends Schema.Component {
  collectionName: 'components_home_home_posts';
  info: {
    displayName: 'HomePost';
    description: '';
  };
  attributes: {
    subject: Attribute.String & Attribute.Required;
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    image: Attribute.Media & Attribute.Required;
  };
}

export interface IntroduceAds extends Schema.Component {
  collectionName: 'components_introduce_ads';
  info: {
    displayName: 'Ads';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    images: Attribute.Media & Attribute.Required;
    button: Attribute.String & Attribute.Required;
    items: Attribute.Text & Attribute.Required;
  };
}

export interface IntroduceAttribute extends Schema.Component {
  collectionName: 'components_introduce_attributes';
  info: {
    displayName: 'Attribute';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    image: Attribute.Media & Attribute.Required;
    count: Attribute.Integer & Attribute.Required;
    unit: Attribute.String;
    character: Attribute.String;
  };
}

export interface IntroduceHistory extends Schema.Component {
  collectionName: 'components_introduce_histories';
  info: {
    displayName: 'History';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    image: Attribute.Media & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    year: Attribute.String & Attribute.Required;
  };
}

export interface IntroduceMission extends Schema.Component {
  collectionName: 'components_introduce_missions';
  info: {
    displayName: 'Mission';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    image: Attribute.Media & Attribute.Required;
    light_image: Attribute.Media & Attribute.Required;
  };
}

export interface ProductDocument extends Schema.Component {
  collectionName: 'components_product_documents';
  info: {
    displayName: 'Document';
    description: '';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    attachment: Attribute.Media & Attribute.Required;
    urlDoc: Attribute.String;
  };
}

export interface ProductGallery extends Schema.Component {
  collectionName: 'components_product_galleries';
  info: {
    displayName: 'Gallery';
    description: '';
  };
  attributes: {
    thumb: Attribute.Media;
    file: Attribute.Media;
    title: Attribute.String;
    description: Attribute.Text;
    link: Attribute.Text;
  };
}

export interface ProductSpecification extends Schema.Component {
  collectionName: 'components_product_specifications';
  info: {
    displayName: 'Specification';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
  };
}

export interface ServiceCommit extends Schema.Component {
  collectionName: 'components_service_commits';
  info: {
    displayName: 'Commit';
  };
  attributes: {
    title: Attribute.String & Attribute.Required;
    description: Attribute.Text & Attribute.Required;
    image: Attribute.Media & Attribute.Required;
  };
}

export interface ServiceCustomerReponse extends Schema.Component {
  collectionName: 'components_service_customer_reponses';
  info: {
    displayName: 'Customer Reponse';
    description: '';
  };
  attributes: {
    avatar: Attribute.Media & Attribute.Required;
    name: Attribute.String & Attribute.Required;
    company: Attribute.Text & Attribute.Required;
    comment: Attribute.Text & Attribute.Required;
  };
}

export interface ServicePartner extends Schema.Component {
  collectionName: 'components_service_partners';
  info: {
    displayName: 'Partner';
  };
  attributes: {
    image: Attribute.Media & Attribute.Required;
  };
}

export interface ServiceQuestion extends Schema.Component {
  collectionName: 'components_service_questions';
  info: {
    displayName: 'Question';
    description: '';
  };
  attributes: {
    question: Attribute.String & Attribute.Required;
    answer: Attribute.Text & Attribute.Required;
    answer_html: Attribute.RichText &
      Attribute.CustomField<
        'plugin::ckeditor.CKEditor',
        {
          output: 'HTML';
          preset: 'rich';
        }
      >;
  };
}

export interface SharedMetaSocial extends Schema.Component {
  collectionName: 'components_shared_meta_socials';
  info: {
    displayName: 'metaSocial';
    icon: 'project-diagram';
  };
  attributes: {
    socialNetwork: Attribute.Enumeration<['Facebook', 'Twitter']> &
      Attribute.Required;
    title: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        maxLength: 60;
      }>;
    description: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        maxLength: 65;
      }>;
    image: Attribute.Media;
  };
}

export interface SharedSeo extends Schema.Component {
  collectionName: 'components_shared_seos';
  info: {
    displayName: 'seo';
    icon: 'search';
  };
  attributes: {
    metaTitle: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        maxLength: 60;
      }>;
    metaDescription: Attribute.String &
      Attribute.Required &
      Attribute.SetMinMaxLength<{
        minLength: 50;
        maxLength: 160;
      }>;
    metaImage: Attribute.Media;
    metaSocial: Attribute.Component<'shared.meta-social', true>;
    keywords: Attribute.Text;
    metaRobots: Attribute.String;
    structuredData: Attribute.JSON;
    metaViewport: Attribute.String;
    canonicalURL: Attribute.String;
  };
}

declare module '@strapi/types' {
  export module Shared {
    export interface Components {
      'home.advantage': HomeAdvantage;
      'home.domain': HomeDomain;
      'home.home-post': HomeHomePost;
      'introduce.ads': IntroduceAds;
      'introduce.attribute': IntroduceAttribute;
      'introduce.history': IntroduceHistory;
      'introduce.mission': IntroduceMission;
      'product.document': ProductDocument;
      'product.gallery': ProductGallery;
      'product.specification': ProductSpecification;
      'service.commit': ServiceCommit;
      'service.customer-reponse': ServiceCustomerReponse;
      'service.partner': ServicePartner;
      'service.question': ServiceQuestion;
      'shared.meta-social': SharedMetaSocial;
      'shared.seo': SharedSeo;
    }
  }
}
