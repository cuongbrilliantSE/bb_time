import ImageResponsive from "@/app/components/ImageResponsive";
import CalendarImg from "@assets/icons/calendar.svg";
import { getDataFromFetch, getImgUrl } from "@lib/index";
import clsx from "clsx";
import { format } from "date-fns";
import { notFound } from "next/navigation";
import { getDictionary } from "../../../../../get-dictionary";
import styles from "./page.module.scss";
import Summary from "./summary";
import Share from "./share";
import PostRelated from "@/app/components/post-relate";

export default async function PostDetailPage({ params, searchParams }) {
  const dictionary = await getDictionary(params.lang);

  const [detailPost] = await getDataFromFetch([
    {
      object: `posts`,
      query: {
        populate: {
          banner: {
            populate: "*",
          },
          author: {
            populate: "*",
          },
          thumb: {
            populate: "*",
          },
        },
        filters: {
          slug: {
            $eq: params.slug,
          },
        },
      },
    },
  ]);

  if (detailPost.meta.pagination.total != 1) {
    notFound();
  }

  const data = detailPost.data[0].attributes;

  return (
    <>
      <p className={clsx(styles.title, "animation")}>{data.title}</p>
      <div className={styles.des}>
        <div className={clsx(styles.author, "animation")}>
          <div className={styles.authorAvatar}>
            <img
              src={getImgUrl(
                data.author.data?.attributes.avatar.data.attributes.url
              )}
            />
          </div>
          <p className={styles.authorName}>
            {data?.author?.data?.attributes?.username}
          </p>
        </div>
        <div className={clsx(styles.divider, "animation")}></div>
        <div className={clsx(styles.updatedAt, "animation")}>
          <img src={CalendarImg.src} />
          <p>{format(new Date(data?.updatedAt), "dd LLLL yyyy")}</p>
        </div>
      </div>

      <div className={clsx(styles.thumb, "animation")}>
        <ImageResponsive data={data.thumb.data.attributes} />
      </div>
      <Summary i18n={dictionary.post} />
      <div
        className={clsx(styles.contents, "animation")}
        dangerouslySetInnerHTML={{ __html: data.content_html }}
      />
      <Share />
    </>
  );
}
