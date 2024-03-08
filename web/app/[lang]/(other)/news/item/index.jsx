'use client'
import styles from "./style.module.scss";
import ImageResponsive from "@/app/components/ImageResponsive";
import Link from "next/link";
import { getImgUrl } from "@lib/index";
import CalendarImg from "@assets/icons/calendar.svg";
import ClockImg from "@assets/icons/clock.svg";
import { format } from "date-fns";
import clsx from "clsx";
import ChevronRightImg from "@components/ChevronRight";
import {usePathname, useRouter} from "next/navigation";

const PostItem = ({ data, i18n }) => {
  const router = useRouter();
  const pathName = usePathname();

  const goToNewsDetail = (slug) => {
    if (!slug) {
      return;
    }
    if (pathName.includes('/news')) {
      router.push(`news/${slug}`);
    }
  }

  return (
    <div className={styles.wp}>
      <div className={clsx(styles.img, "animation")}>
        <ImageResponsive data={data.thumb.data.attributes} />
      </div>
      <span
        onClick={() => goToNewsDetail(data.slug)}
        className={clsx(styles.title, "animation")}
        style={{cursor: 'pointer'}}
      >
        {data.title}
      </span>
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
        <div className={clsx(styles.divider, "animation")}></div>
        <div className={clsx(styles.minRead, "animation")}>
          <img src={ClockImg.src} />
          <p>3 min. to read</p>
        </div>
      </div>
      <p className={clsx(styles.desTxt, "animation")}>{data.description}</p>
      <Link
        href={`/news/${data.slug}`}
        className={clsx(styles.detailBtn, "animation")}
      >
        <p>{i18n.view_detail}</p>
        <ChevronRightImg />
      </Link>
    </div>
  );
};

export default PostItem;
