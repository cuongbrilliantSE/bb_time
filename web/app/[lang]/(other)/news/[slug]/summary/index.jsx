"use client";
import clsx from "clsx";
import styles from "./style.module.scss";

const Summary = ({i18n, data}) => {
  return (
    <div className={clsx(styles.container, "animation")}>
      <p className={styles.titleSummary}>{i18n.summary}</p>

      <div
        className={clsx(styles.summary)}
        dangerouslySetInnerHTML={{__html: data}}
      />
    </div>
  );
};

export default Summary;
