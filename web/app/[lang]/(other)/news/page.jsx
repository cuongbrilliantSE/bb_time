import {getDictionary} from "../../../../get-dictionary";
import {getDataFromFetch} from "@lib/index";
import styles from "./page.module.scss";
import clsx from "clsx";
import PostItem from "./item";

import ImageResponsive from "@/app/components/ImageResponsive";
import BreadCrumb from "@components/Breadcrumb";
import ChevronRightImg from "@components/ChevronRight";

import Link from "next/link";

import ListCategories from "./list-categories";
import Gallery from "./galley";
import Tags from "./tags";

export default async function PostPage({params, searchParams}) {
  const page = searchParams?.page || 1;
  const dictionary = await getDictionary(params.lang);

  const [posts, postPage, categories, tags] = await getDataFromFetch([{
    object: "posts", query: {
      sort: "updatedAt", pagination: {
        page, pageSize: 8,
      }, populate: {
        thumb: {
          populate: "*",
        }, author: {
          populate: "*",
        },
      },
      locale: params.lang === 'en' ? params.lang : 'vi-VN',
    },
  }, {
    object: "post-page", query: {
      populate: {
        banner: "*",
      },
      locale: params.lang === 'en' ? params.lang : 'vi-VN',
    },
  },

    {
      object: "post-category/count-post", query: {
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    }, {
      object: "tags", query: {
        locale: params.lang === 'en' ? params.lang : 'vi-VN',
      },
    },]);

  return (<main>
      <ImageResponsive
        className="max-width-container"
        data={postPage?.data?.attributes?.banner?.data?.attributes}
      />
      <div className="container">
        <div className={clsx(styles.breadcrumbWp, "animation")}>
          <BreadCrumb
            data={[{title: dictionary.nav.home, url: "/"}, {title: dictionary.nav.news},]}
          />
        </div>
        <div className={styles.wp}>
          <div className={styles.postWp}>
            <p className={clsx(styles.title, "animation")}>
              <b>{dictionary.post.news}</b>
            </p>
            {posts.data.map((i, idx) => (<div className={styles.postItem} key={idx}>
                <PostItem i18n={dictionary.post} data={i.attributes}/>
              </div>))}
          </div>
          <div className={styles.sideWp}>
            <ListCategories i18n={dictionary.post} data={categories}/>
            <Gallery i18n={dictionary.post}/>
            <Tags i18n={dictionary.post} data={tags.data}/>
          </div>
        </div>
      </div>
      <div className={styles.end}></div>
    </main>);
}
