# Project Context for Claude AI (or any LLM)

Hello! If you are analyzing this codebase, this document provides a comprehensive overview of the portfolio project to give you immediate context on its architecture, design decisions, and features.

## 1. Project Overview
This is a modern, responsive, and highly interactive developer portfolio for Mohammed Sahid Asrafi (a 3rd-year CSE student). It is built entirely using vanilla web technologies without any heavy frameworks. It is designed to be a "premium" experience, featuring complex animations and a unique color theme.

## 2. File Structure
The project is located in the root directory and contains the following structure:
- `index.html`: The main HTML structure containing all sections (Hero, Stats, About, Skills, Experience, Hackathons, Projects, Certifications, Contact, and a Certificate Modal).
- `css/style.css`: Contains all styling, CSS variables, keyframe animations, and responsiveness logic.
- `js/script.js`: Handles all interactivity (loading screen, custom cursor, Intersection Observers for scroll reveals, particle canvas, typing effect, and modal logic).
- `images/`: Directory containing static assets like `profile.jpg`, `codec_cert.pdf`, and `iot_cert.jpg`.

## 3. Technology Stack
- **Structure:** HTML5 (Semantic elements)
- **Styling:** Vanilla CSS3 (CSS Variables, Flexbox, CSS Grid, `@keyframes`, backdrop-filters)
- **Interactivity:** Vanilla JavaScript (ES6+, DOM Manipulation, `IntersectionObserver`, HTML5 `<canvas>`)
- **Icons:** FontAwesome 6
- **Typography:** Google Fonts (Poppins, Inter, Fira Code)

## 4. Design System & Theme
The project uses a custom "Cyber-Gold & Emerald" premium developer theme designed to avoid common blue/purple tropes.
- **Backgrounds:** Deep charcoal (`#0a0a0a`, `#121212`, `#1a1a1a`)
- **Text:** Light gray (`#e0e0e0`), muted gray (`#9e9e9e`)
- **Primary Accent:** Gold (`#FFD700`) - Used for highlights, active states, custom cursor.
- **Secondary Accent:** Emerald Green (`#00FA9A`) - Used for gradients, progress bars, success states.

## 5. Key Features & Complex Logic
When modifying this codebase, please be aware of these interconnected systems:

1. **Terminal Loading Screen:** Controlled via `script.js`. It fakes a terminal boot sequence using `setTimeout` chains before fading out and initializing the typewriter and particle systems.
2. **Custom Cursor:** Replaces the default pointer with a small gold dot and a trailing glow. It detects hover states on interactable elements (`a, button, .card-hover`) to expand visually. *Note: Disabled on mobile devices via CSS/JS media queries.*
3. **Particle Background:** A custom HTML5 `<canvas>` network in the hero section. Particles bounce off the edges and draw connecting lines to each other and to the user's mouse position if they get close enough.
4. **Scroll Animations:** Uses the `IntersectionObserver` API heavily. 
   - `.reveal-element` classes fade/slide up into view.
   - Skill progress bars fill up only when scrolled into view.
   - Stat counters count up from 0 to their target number when visible.
5. **Certificate Modal:** 
   - Found at the bottom of `index.html`.
   - The Certifications section uses `.bubble-item` elements with `data-cert-type` (image or pdf) and `data-cert-src`.
   - When clicked, `script.js` dynamically injects either an `<img>` or an `<iframe>` into the modal body.
   - Contains distinct CSS `@keyframes`: `modalOpen` (zoom/fade in) and `modalClose` (scale/fade out).

## 6. Development Rules
If you are generating code for this project, please adhere to:
- **No Frameworks:** Keep it vanilla HTML/CSS/JS.
- **Maintain the Theme:** Only use the CSS variables defined in `:root`.
- **Performance:** For scroll events, prefer `IntersectionObserver` over `window.addEventListener('scroll')` where possible to prevent layout thrashing.
