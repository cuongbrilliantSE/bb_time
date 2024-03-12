'use client';
import clsx from "clsx";
import MenuImg from "@assets/icons/menu_line.svg";
import Link from "next/link";
import styles from "./style.module.scss";
import { formatPrefixNumber } from "@lib/index";
import {usePathname, useRouter, useSearchParams} from "next/navigation";

const ListCategories = ({ i18n, data }) => {

  const router = useRouter();
  const params = useSearchParams()
  const pathName = usePathname();
  const categoryActive = params.get('category') || null;

  const goToNewsCategory = (slug) => {
    if (!slug) {
      return;
    }
    if (pathName.includes('news/')) {
      const uri = pathName.split('news/')[0];
      router.replace(`${uri}/news?category=${slug}`);
      return;
    }
    router.push(`news?category=${slug}`);
  }
  return (
    <div className={styles.wp}>
      <div className={clsx(styles.txt, "animation")}>
        <img src={MenuImg.src} />
        <p>{i18n.category}</p>
      </div>
      {data.map((i, idx) => (
        <span
          style={{cursor: 'pointer'}}
          onClick={() => goToNewsCategory(i.slug)}
          key={idx}
          className={
          clsx(styles.cateWp, "animation",
            {[styles.active]: categoryActive && categoryActive === i.slug})}
        >
          <p className={styles.cateTitle}>{i.title}</p>
          <p className={styles.cateCount}>
            {formatPrefixNumber(i.posts.count)}
          </p>
        </span>
      ))}
    </div>
  );
};

export default ListCategories;
