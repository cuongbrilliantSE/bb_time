// CustomPopup.js
import React from 'react';
import Popup from 'reactjs-popup';
import styles from './style.module.scss'; // adjust the path as per your project structure

const CustomPopup = ({ trigger, header, content_html }) => {
    const contentStyle = {
        background: '#fff',
        minWidth: '600px',
        maxWidth: '600px',
        minHeight: '200px',
        overflowX: 'hidden',
        overflowY: 'auto',
        border: '1px solid #d7d7d7',
        borderRadius: '5px'
    };

    const overlayStyle = { background: 'rgba(0,0,0,0.5)' };
    const arrowStyle = { color: '#000' };

    console.log('ahihi')
    return (
        <Popup
            trigger={trigger}
            modal
            nested
            {...{ contentStyle, overlayStyle, arrowStyle }}
        >
            {close => (
                <div className={styles.modal}>
                    <button className={styles.close} onClick={close}>
                        &#215;
                    </button>
                    <div className={styles.header}>{header}</div>
                    <div
                        className={styles.content}
                        dangerouslySetInnerHTML={{ __html: content_html }}
                    />
                </div>
            )}
        </Popup>
    );
};

export default CustomPopup;
