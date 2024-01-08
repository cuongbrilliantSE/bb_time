"use client";
import clsx from "clsx";
import styles from "./style.module.scss";
import Collapse from "@/app/components/Collapse";
import { useState } from "react";
import ArrowUpImg from "@assets/icons/arrow_up.svg";
import Link from "next/link";

const mock = [
  "1.1 Created a Developer Rap Video - Here's What I Learned",
  "1.2 Created a Developer Rap Video - Here's What I Learned",
  "1.3 Created a Developer Rap Video - Here's What I Learned",
  "1.4 Created a Developer Rap Video - Here's What I Learned",
];

const Summary = ({ i18n, data }) => {
  const [open, setOpen] = useState(true);
  return (
    <div className={styles.wp}>
      <div
        onClick={() => setOpen(!open)}
        className={clsx(styles.btn, "animation", { [styles.btnOpen]: open })}
      >
        {i18n.summary}
        <img src={ArrowUpImg.src} />
      </div>
      <Collapse open={open}>
        <div>
          {mock.map((i, idx) => (
            <div key={idx} href="#" className={clsx(styles.link, "animation")}>
              {i}
            </div>
          ))}
        </div>
      </Collapse>
    </div>
  );
};

export default Summary;
