"use client";
import clsx from "clsx";
import styles from "./style.module.scss";
import QuestionItem from "./question-item";
import _ from "lodash";
import { useMemo } from "react";

const Question = ({ i18n, data }) => {
  const splitQuestion = useMemo(() => {
    if (data.questions) {
      return _.chunk(data.questions, Math.ceil(data.questions.length / 2));
    }
    return [[], []];
  }, [data.questions]);

    console.log(data);

  return (
    <section className={clsx("container", styles.wp)}>
      <p className={clsx(styles.txt, "animation")}>{i18n.question}</p>
      <p className={clsx(styles.des, "animation")}>{i18n.question_des}</p>
      <div className={clsx(styles.questions, styles.mb)}>
        {data.questions.map((i, idx) => (
          <QuestionItem key={idx} data={i} />
        ))}
      </div>
      <div className={styles.desktop}>
        <div className={styles.questions}>
          {splitQuestion?.[0].map((i, idx) => (
            <QuestionItem key={idx} data={i} />
          ))}
        </div>
        <div className={styles.questions}>
          {splitQuestion?.[1].map((i, idx) => (
            <QuestionItem key={idx} data={i} />
          ))}
        </div>
      </div>
    </section>
  );
};

export default Question;
