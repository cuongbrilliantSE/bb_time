"use client";
import { usePathname } from "next/navigation";
import { useEffect } from "react";

/*****************
 * ADD ANIMATION *
 *****************/

// Tell the observer which elements to track

/*****************
 * END ADD ANIMATION *
 *****************/

const AnimationInject = () => {
  const pathname = usePathname();
  useEffect(() => {
    const observer = new IntersectionObserver((entries) => {
      // Loop over the entries
      entries.forEach((entry) => {
        // If the element is visible
        if (entry.isIntersecting) {
          // Add the animation class
          const animationName = entry.target.getAttribute("data-animation");
          entry.target.classList.add(animationName || "fade-in-down");
          entry.target.style.opacity = 1;
        }
      });
    });
    document.querySelectorAll(".animation").forEach((element) => {
      const animationDelay = element.getAttribute("data-animation-delay");
      element.style.animationDelay = animationDelay || "0.2s";
      element.style.opacity = 0;
      observer.observe(element);
    });
  }, [pathname]);
  return null;
};

export default AnimationInject;
