import VnImg from "@assets/flags/vi.svg";
import ChevronDownImg from "@assets/icons/chevron_down.svg";
import { Fragment } from "react";

const ChangeLanguage = () => {
  return (
    <Fragment>
      <div className="btn-change-lang">
        <div className="btn-change-lang-flag">
          <img src={VnImg.src} alt="" />
        </div>
        <img src={ChevronDownImg.src} alt="chevron-down" />
      </div>
    </Fragment>
  );
};

export default ChangeLanguage;
