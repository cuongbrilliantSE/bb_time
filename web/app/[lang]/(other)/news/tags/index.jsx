import clsx from "clsx";
import styles from "./style.module.scss";
import MenuImg from "@assets/icons/menu_line.svg";

const Tags = ({ i18n, data }) => {
  return (
    <div className={styles.wp}>
      <div className={clsx(styles.txt, "animation")}>
        <img src={MenuImg.src} />
        <p>{i18n.tags}</p>
      </div>
      <div className={styles.tagList}>
        {data.map((i, idx) => (
          <div key={idx} className={clsx(styles.item, "animation")}>
            {i.attributes.title}
          </div>
        ))}
      </div>
    </div>
  );
};

export default Tags;
