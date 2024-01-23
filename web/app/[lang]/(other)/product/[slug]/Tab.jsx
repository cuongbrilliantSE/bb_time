"use client";
import { useState, useEffect } from "react";
import styles from "./page.module.scss";
import clsx from "clsx";

const Tab = ({ i18n }) => {
  const [isMounted, setMounted] = useState(false);
  const [selected, setSelected] = useState("info");
  const [sticky, setSticky] = useState(false);

  const toggleVisible = () => {
    if (document.documentElement.scrollTop > 380) {
      setSticky(true);
    } else {
      setSticky(false);
    }
  };

  useEffect(() => {
    window.addEventListener("scroll", toggleVisible);
    return () => window.removeEventListener("scroll", toggleVisible);
  }, []);

  useEffect(() => {
    if (isMounted) {
      if (window.location.hash) {
        const _hash = window.location.hash.substring(1);
        setSelected(_hash || "info");
        if (_hash == "specification" || _hash == "gallery") {
          const element = document.getElementById(_hash);
          element.scrollIntoView({ behavior: "smooth" });
        }
      }
    } else {
      setMounted(true);
    }
  }, [isMounted]);

  const onChangeTab = (tab) => {
    setSelected(tab);
    const element = document.getElementById(tab);
    element.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <section className={clsx(styles.secTab, { [styles.sticky]: sticky })}>
      <p
        onClick={() => onChangeTab("info")}
        className={clsx(styles.tabBtn, "animation", {
          [styles.tabSelected]: selected == "info",
        })}
      >
        {i18n.info}
      </p>
      <p
        onClick={() => onChangeTab("specification")}
        data-animation-delay="0.2s"
        className={clsx(styles.tabBtn, "animation", {
          [styles.tabSelected]: selected == "specification",
        })}
      >
        {i18n.specifications}
      </p>
      <p
        onClick={() => onChangeTab("gallery")}
        data-animation-delay="0.4s"
        className={clsx(styles.tabBtn, "animation", {
          [styles.tabSelected]: selected == "gallery",
        })}
      >
        {i18n.galleries}
      </p>
    </section>
  );
};

export default Tab;
