import { useState, useEffect } from "react";

function useWindowSize() {
  const [windowSize, setWindowSize] = useState(0);
  useEffect(() => {
    function handleResize() {
      setWindowSize(window.innerWidth);
    }

    window.addEventListener("resize", handleResize);
    handleResize();
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  return {
    width: windowSize,
    isDesktop: windowSize > 1199,
    isTablet: windowSize <= 1199 && windowSize >= 768,
    isMobile: windowSize < 768,
  };
}

export default useWindowSize;
