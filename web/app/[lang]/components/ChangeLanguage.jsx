import VnImg from "@assets/flags/vi.svg";
import EnImg from "@assets/flags/en.svg";
import ChevronDownImg from "@assets/icons/chevron_down.svg";
import {Fragment, useEffect, useState} from "react";
import {usePathname, useRouter} from "next/navigation";

const ChangeLanguage = () => {
  const [isVn, setIsVN] = useState(true);
  const router = useRouter();
  const pathname = usePathname();

  useEffect(() => {
    if (!pathname.includes('/vi/')) {
      setIsVN(false);
    }
  }, [pathname]);

  const changeLanguage = () => {
    let url = '';
    if (pathname.includes('/vi')) {
      url = pathname.replace('/vi', '/en');
    } else {
      url = pathname.replace('/en', '/vi');
    }
    router.push(url);
  }


  return (
    <Fragment>
      <div className="btn-change-lang" onClick={() => {
        setIsVN(!isVn);
        changeLanguage();
      }}>
        <div className="btn-change-lang-flag">
          <img src={isVn ? VnImg.src : EnImg.src} alt="" />
        </div>
        <img src={ChevronDownImg.src} alt="chevron-down" />
      </div>
    </Fragment>
  );
};

export default ChangeLanguage;
