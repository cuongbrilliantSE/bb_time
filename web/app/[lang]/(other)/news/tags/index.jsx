'use client';
import clsx from "clsx";
import styles from "./style.module.scss";
import MenuImg from "@assets/icons/menu_line.svg";
import {usePathname, useRouter, useSearchParams} from "next/navigation";

const Tags = ({i18n, data}) => {
  const router = useRouter();
  const pathName = usePathname();
  const params = useSearchParams()
  const tagActive = params.get('tag') || null;


  console.log(tagActive)

  const goToTags = (tag) => {
    if (!tag) {
      return;
    }
    if (pathName.includes('news/')) {
      const uri = pathName.split('news/')[0];
      router.replace(`${uri}/news?tag=${tag}`);
      return;
    }
    router.push(`news?tag=${tag}`);
  }
  return (
    <div className={styles.wp}>
      <div className={clsx(styles.txt, "animation")}>
        <img src={MenuImg.src}/>
        <p>{i18n.tags}</p>
      </div>
      <div className={styles.tagList}>
        {data.map((i, idx) => (
          <div key={idx} className={clsx(
            styles.item, "animation",
            {[styles.active]: tagActive && tagActive === i.attributes.slug}
          )}
               onClick={() => goToTags(i.attributes.slug)}>
            {i.attributes.title}
          </div>
        ))}
      </div>
    </div>
  );
};

export default Tags;
