import clsx from "clsx";
import MenuImg from "@assets/icons/menu_line.svg";
import Link from "next/link";
import styles from "./style.module.scss";
import { formatPrefixNumber } from "@lib/index";

const ListCategories = ({ i18n, data }) => {
  return (
    <div className={styles.wp}>
      <div className={clsx(styles.txt, "animation")}>
        <img src={MenuImg.src} />
        <p>{i18n.category}</p>
      </div>
      {data.map((i, idx) => (
        <Link
          href={`/news?category=${i.slug}`}
          key={idx}
          className={clsx(styles.cateWp, "animation")}
        >
          <p className={styles.cateTitle}>{i.title}</p>
          <p className={styles.cateCount}>
            {formatPrefixNumber(i.posts.count)}
          </p>
        </Link>
      ))}
    </div>
  );
};

export default ListCategories;
