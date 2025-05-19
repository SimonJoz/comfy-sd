## 1. Pose Prompts

### Flux Dev

```
[Flux Dev | model:bodyV2] posed {POSE DESCRIPTION}, anatomical accuracy, cinematic detail
```

| Pose Name           | Flux Dev Pose Description                                                                         |
|---------------------|---------------------------------------------------------------------------------------------------|
| Confident Seductive | standing tall, one hand on hip, slight arch in back, head tilted, intense eye contact with camera |
| Soft & Inviting     | seated on edge of bed, legs crossed, shoulders relaxed, open smile, gentle hand through hair      |
| Dominant & Bold     | leaning forward slightly, elbows on thighs, direct stare, parted lips, assertive body language    |
| Relaxed Lounge      | lying on side, one arm propping head, eyes sideways, soft natural expression                      |
| Mirror Selfie       | holding phone in one hand, angled hips, subtle hip pop, reflected in mirror, casual flirty vibe   |
| Playful Tease       | back turned to camera, looking over shoulder with smirk, one foot up, hand gently pulling strap   |

### SDXL

```
{POSE DESCRIPTION}, photorealistic full-body portrait, cinematic lighting, 4K
```

| Pose Name           | SDXL Pose Description                                                                              |
|---------------------|----------------------------------------------------------------------------------------------------|
| Confident Seductive | standing tall with one hand on hip, slight back arch, head tilted forward, intense gaze            |
| Soft & Inviting     | sitting on bed edge with legs crossed, shoulders relaxed, warm smile, fingers running through hair |
| Dominant & Bold     | leaning forward with elbows on knees, direct stare at camera, parted lips                          |
| Relaxed Lounge      | lying on side, propped on elbow, looking away, serene gentle expression                            |
| Mirror Selfie       | holding phone up at angle, hip cocked to side, mirror reflection, playful smirk                    |
| Playful Tease       | turned back to camera, glancing over shoulder, one leg bent, tugging lingerie strap                |

---

## 2. Environment / Scene Prompts

### Flux Dev

```
[Flux Dev | model:bodyV2] full-body portrait in a [SETTING], soft background blur, cinematic lighting, 8K
```

| Setting           | Flux Dev Module                                                             |
|-------------------|-----------------------------------------------------------------------------|
| Luxurious Bedroom | opulent bedroom with velvet headboard, silk sheets, warm ambient lamp light |
| Tropical Poolside | pool deck with palm fronds, turquoise water reflections, dappled sunlight   |
| Urban Rooftop     | concrete rooftop at dusk, city skyline bokeh, neon signage glow             |
| Industrial Loft   | exposed brick walls, large factory windows, soft natural daylight           |
| Boudoir           | sheer curtains, vintage chaise lounge, soft-focus candlelight               |
| Neon Studio       | colored neon tubes, black reflective floor, high-contrast rim lighting      |

### SDXL

```
full-body photorealistic portrait in a [SETTING], realistic props, natural shadows, 4K
```

| Setting           | SDXL Module                                                             |
|-------------------|-------------------------------------------------------------------------|
| Luxurious Bedroom | luxury bedroom with tufted headboard, plush pillows, soft morning light |
| Tropical Poolside | sunlit pool edge, tropical palms overhead, water sparkles               |
| Urban Rooftop     | city skyline at twilight, string lights, concrete ledge                 |
| Industrial Loft   | warehouse-style loft, exposed beams, large metal-framed windows         |
| Boudoir           | silk drapes, rose petals on floor, warm lamp glow                       |
| Neon Studio       | vibrant neon grid backdrop, reflective metallic floor                   |

---

## 3. Camera Framing Prompts

### Flux Dev

```
[Flux Dev | model:faceV2] {FRAMING}, cinematic detail, sharp focus, 4K
```

| Framing            | Example                                          |
|--------------------|--------------------------------------------------|
| Extreme Close-Up   | very tight headshot, eyes and lips filling frame |
| Close-Up           | face and shoulders centered                      |
| Medium Shot        | waist-up portrait                                |
| Three-Quarter Shot | mid-thigh composition                            |
| Full-Body Wide     | full figure with ample background                |
| Over-The-Shoulder  | camera behind shoulder looking toward face       |

### SDXL

```
{FRAMING}, photorealistic portrait, cinematic lighting, 8K
```

| Framing            | Example                          |
|--------------------|----------------------------------|
| Extreme Close-Up   | very tight shot on eyes and lips |
| Close-Up           | head and neck focus              |
| Medium Shot        | waist-up                         |
| Three-Quarter Shot | mid-thigh                        |
| Full-Body Wide     | entire body with environment     |
| Over-The-Shoulder  | view over shoulder toward face   |

---

## 4. Emotion / Expression Prompts

### Flux Dev

```
[Flux Dev | model:faceV2] expressive portrait with [EXPRESSION], high detail, cinematic lighting
```

| Expression      | Flux Dev Module                               |
|-----------------|-----------------------------------------------|
| Teasing Smile   | slight smirk, lips parted, eyes half-closed   |
| Sultry Gaze     | intense eye contact, slightly lowered eyelids |
| Warm Laughter   | open-mouthed laugh, crinkling at eyes         |
| Playful Wink    | one eye closed, head tilted                   |
| Soft Dreaminess | relaxed eyes, gentle half-smile               |
| Confident Stare | direct gaze, neutral lips                     |

### SDXL

```
{EXPRESSION}, photorealistic headshot, soft lighting, 8K
```

| Expression      | SDXL Module                           |
|-----------------|---------------------------------------|
| Teasing Smile   | slight smirk with parted lips         |
| Sultry Gaze     | piercing direct gaze, lowered eyelids |
| Warm Laughter   | joyful open smile with eye crinkles   |
| Playful Wink    | one eye winked, head tilt             |
| Soft Dreaminess | dreamy half-smile, relaxed eyes       |
| Confident Stare | unwavering direct stare               |

---

## 5. Style & Post-Processing Prompts

### Flux Dev

```
[Flux Dev | model:bodyV2] full-body portrait, [STYLE TAGS], cinematic detail, sharp focus
```

| Style Tag        | Flux Dev Module                                    |
|------------------|----------------------------------------------------|
| Softcore Glam    | soft glow, low contrast, skin highlight sheen      |
| High Fashion     | desaturated palette, crisp shadows, editorial mood |
| Boudoir Chic     | warm tones, vignette, film-grain texture           |
| Digital Surreal  | slight color shifts, subtle lens distortions       |
| Classic Portrait | neutral tones, gentle backlight, minimal grain     |

### SDXL

```
[STYLE TAGS], photorealistic, detailed textures, 4K
```

| Style Tag        | SDXL Module                                    |
|------------------|------------------------------------------------|
| Softcore Glam    | soft glow, gentle bokeh                        |
| High Fashion     | crisp detail, muted color palette              |
| Boudoir Chic     | warm film-grain look, subtle vignette          |
| Digital Surreal  | slight chromatic aberration, dreamy color wash |
| Classic Portrait | natural tones, minimal post-effect             |

---

## 6. Dynamic / Action Prompts (Optional)

### Flux Dev

```
[Flux Dev | model:bodyV2] in-motion capture of model [ACTION], high frame-like detail, realistic anatomy
```

| Action            | Flux Dev Module                               |
|-------------------|-----------------------------------------------|
| Hair Flip         | tossing hair back, motion blur at tips        |
| Strap Adjustment  | one hand lifting lingerie strap, subtle lean  |
| Walking Forward   | mid-stride, slight body sway                  |
| Reclining Stretch | arching back with arms overhead               |
| Mirror Touch      | fingertips on mirror surface, soft reflection |

### SDXL

```
[action], photorealistic, motion blur, 4K
```

| Action            | SDXL Module                           |
|-------------------|---------------------------------------|
| Hair Flip         | flipping hair with slight motion blur |
| Strap Adjustment  | pulling lingerie strap, torso lean    |
| Walking Forward   | stepping forward mid-stride           |
| Reclining Stretch | stretching back with arms raised      |
| Mirror Touch      | touching mirror, faint reflection     |

## Flux Dev Combined Generic Prompt

```
[Flux Dev | model:bodyV2] ultra-realistic full-body portrait of a [ethnicity or region]-inspired AI influencer, [skin tone] skin with [finish type], perfect hourglass S-curve silhouette (waist-to-hip 0.7), medium-large [breast shape], large round buttocks, wearing [key outfit elements], posed [pose description], set in a [environment setting], framed as a [camera framing], expression [emotion/expression], styled in [style tags], lit by [lighting type], soft background blur, anatomical accuracy, cinematic 8K detail
```

| Placeholder            | Example Options                                                              |
|------------------------|------------------------------------------------------------------------------|
| \[ethnicity or region] | Latina, Scandinavian, East Asian, African, Mediterranean, South Asian, Mixed |
| \[skin tone]           | honey-bronze, porcelain, caramel, olive-golden, rich mahogany, light tan     |
| \[finish type]         | dewy glow, soft sheen, matte texture, velvet finish                          |
| \[breast shape]        | natural round, perky teardrop, soft contour                                  |
| \[key outfit elements] | sheer lace bralette & thong, silk wrap dress, leather corset & shorts        |
| \[pose description]    | standing tall, one hand on hip, slight back arch, intense gaze               |
| \[environment setting] | boudoir with rose petals, tropical poolside, neon-lit urban rooftop          |
| \[camera framing]      | full-body wide shot, three-quarter shot, medium shot waist-up                |
| \[emotion/expression]  | sultry gaze, teasing smile, warm laughter, playful wink                      |
| \[style tags]          | softcore glam, boudoir chic, high-fashion editorial                          |
| \[lighting type]       | golden-hour backlight, dramatic chiaroscuro, diffused studio                 |

---

## SDXL Combined Generic Prompt

```
ultra-realistic photorealistic full-body portrait of a [ethnicity or region] AI influencer, [skin tone] skin with [finish type], hourglass figure (waist-to-hip 0.7), medium-large [breast shape], sculpted round buttocks, dressed in [key outfit elements], striking [pose description], located in a [environment setting], captured as a [camera framing], showing [emotion/expression], rendered in [style tags], illuminated by [lighting type], detailed fabric textures, natural shadows, 4K cinematic
```

| Placeholder            | Example Options                                                               |
|------------------------|-------------------------------------------------------------------------------|
| \[ethnicity or region] | Latina, Scandinavian, East Asian, African, Mediterranean, South Asian, Mixed  |
| \[skin tone]           | warm honey-bronze, porcelain-pearl, soft caramel, olive-golden, deep mahogany |
| \[finish type]         | soft sheen, dewy glow, matte finish, velvety texture                          |
| \[breast shape]        | natural round, teardrop-perky, full contour                                   |
| \[key outfit elements] | translucent mesh lingerie set, silk drape gown, strappy leather ensemble      |
| \[pose description]    | sitting on bed edge with legs crossed, leaning forward with elbows on knees   |
| \[environment setting] | luxury bedroom, industrial loft, tropical garden, graffiti studio             |
| \[camera framing]      | full-body, three-quarter, medium waist-up                                     |
| \[emotion/expression]  | confident stare, soft dreaminess, teasing smirk                               |
| \[style tags]          | digital surreal, high fashion, boudoir glam                                   |
| \[lighting type]       | soft backlight halo, warm sunset glow, neon directional                       |


