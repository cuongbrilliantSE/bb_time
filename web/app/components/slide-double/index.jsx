import ImageResponsive from "../ImageResponsive";
import styles from "./style.module.scss";
import clsx from "clsx";

const SlideSuffle = ({ data }) => {
  return (
    <div className={styles.wp}>
      <div className={clsx(styles.item, styles.itemOne)}>
        <ImageResponsive data={data[0].attributes} />
      </div>
      <div className={clsx(styles.item, styles.itemTwo)}>
        <ImageResponsive data={data[1].attributes} />
      </div>
    </div>
  );
};

export default SlideSuffle;
