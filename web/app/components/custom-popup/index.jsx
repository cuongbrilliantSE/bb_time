// CustomPopup.js
'use client'
import React from 'react';
import Popup from 'reactjs-popup';
import styles from './style.module.scss'; // adjust the path as per your project structure

const CustomPopup = ({ trigger, header, content_html }) => {
    // Define base content style
    const contentStyle = {
        width: '80%',
        background: '#fff',
        border: '1px solid #d7d7d7',
        borderRadius: '5px',
        padding: '20px'
    };

    // Define styles for mobile devices
    const mobileContentStyle = {
        ...contentStyle,
        width: '90%', // Adjust width for smaller screens
        maxWidth: 'none', // Remove max-width restriction
        maxHeight: '80vh', // Limit maximum height
        overflowY: 'auto', // Add vertical scrollbar if needed
        margin: '10% auto' // Center the popup vertically
    };

    // Define overlay and arrow styles
    const overlayStyle = { background: 'rgba(0,0,0,0.5)' };
    const arrowStyle = { color: '#000' };

    // Determine which content style to use based on screen size
    const currentContentStyle = window && window?.innerWidth <= 768 ? mobileContentStyle : contentStyle;

    return (
        <Popup
            trigger={trigger}
            modal
            nested
            contentStyle={currentContentStyle} // Apply dynamic content style
            overlayStyle={overlayStyle}
            arrowStyle={arrowStyle}
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
