import { defineConfig } from 'astro/config';
import cloudflare from '@astrojs/cloudflare';

// https://astro.build
export default defineConfig({
  output: 'server',
  adapter: cloudflare({
    // Change the asset binding name to prevent the Cloudflare conflict
    assets: {
      binding: 'LOCAL_ASSETS',
    },
  }),
});
