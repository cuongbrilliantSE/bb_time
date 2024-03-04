"use client";
import clsx from "clsx";
import { useState } from "react";
import styles from "./style.module.scss";
import Collapse from "@components/Collapse";
import ChevronRight from "@/app/components/ChevronRight";

const QuestionItem = ({ data }) => {
  //   console.log(data);
  const [open, setOpen] = useState(false);

  return (
    <div className={styles.wp}>
      <div
        className={clsx(styles.btn, "animation", { [styles.selected]: open })}
        onClick={() => setOpen(!open)}
      >
        <p>{data.question}</p>
        <ChevronRight />
      </div>
      <Collapse open={open}>
        <p className={styles.answer}
           dangerouslySetInnerHTML={{ __html: data.answer_html }} />
      </Collapse>
    </div>
  );
};

export default QuestionItem;
