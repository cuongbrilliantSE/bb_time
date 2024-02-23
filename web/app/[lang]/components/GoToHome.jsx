"use client";
import UpImg from "@assets/icons/arrow_up_outlined.svg";
import { useEffect, useState } from "react";

const GoToHome = () => {
  const [showBtn, setShowBtn] = useState(false);

  const toggleVisible = () => {
    if (
      document.body.scrollTop > 1200 ||
      document.documentElement.scrollTop > 1200
    ) {
      setShowBtn(true);
    } else {
      setShowBtn(false);
    }
  };

  const handleBackToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  };

  useEffect(() => {
    window.addEventListener("scroll", toggleVisible);
    return () => window.removeEventListener("scroll", toggleVisible);
  }, []);

  return (
    <div
      className="btn-scroll-to-head"
      onClick={handleBackToTop}
      style={{
        transform: showBtn ? "translateY(-90px)" : "",
      }}
    >
      <img src={UpImg.src} />
    </div>
  );
};

export default GoToHome;
