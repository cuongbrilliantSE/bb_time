import { getDataFromFetch } from "@lib/index";
import clsx from "clsx";
import { getDictionary } from "../../../../../get-dictionary";
import styles from "./layout.module.scss";

import ImageResponsive from "@/app/components/ImageResponsive";
import BreadCrumb from "@components/Breadcrumb";
import Share from "./share";
import Gallery from "../galley";
import ListCategories from "../list-categories";
import Tags from "../tags";
import PostRelated from "@/app/components/post-relate";

export default async function DetailPostLayout({ params, children }) {
  const dictionary = await getDictionary(params.lang);

  const [postPage, categories, tags, posts] = await getDataFromFetch([
    {
      object: "post-page",
      query: {
        populate: {
          banner: "*",
        },
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },

    {
      object: "post-category/count-post",
      query: {
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
    {
      object: "tags",
      query: {
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
    {
      object: `posts`,
      query: {
        populate: {
          posts: {
            populate: "*",
          },
        },
        filters: {
          slug: {
            $eq: params.slug,
          },
        },
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },
  ]);

  if (posts.meta.pagination.total != 1) {
    notFound();
  }

  const detailPost = posts.data[0].attributes;

  return (
    <main>
      <ImageResponsive
        className="max-width-container"
        data={postPage?.data?.attributes?.banner?.data?.attributes}
      />
      <div className={clsx("container", styles.lgContainer)}>
        <div className={clsx(styles.breadcrumbWp, "animation")}>
          <BreadCrumb
            data={[
              { title: dictionary.nav.home, url: "/" },
              { title: dictionary.nav.news },
            ]}
          />
        </div>
        <div className={styles.wp}>
          <div className={styles.postWp}>{children}</div>
          <div className={styles.sideWp}>
            <ListCategories i18n={dictionary.post} data={categories} />
            <Gallery i18n={dictionary.post} />
            <Tags i18n={dictionary.post} data={tags.data} />
          </div>
        </div>
      <Share from="layout" />
      <section className={clsx("container", styles.lgContainer)}>
        <PostRelated product={detailPost} i18n={dictionary.product} />
      </section>

      </div>
      <div className={styles.end}></div>
    </main>
  );
}
