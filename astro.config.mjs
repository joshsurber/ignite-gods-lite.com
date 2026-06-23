import { defineConfig } from 'astro/config';
import cloudflare from '@astrojs/cloudflare'; // 1. Import the adapter

// https://astro.build/config
export default defineConfig({
  output: 'server', // 2. Tell Astro to render on demand
  adapter: cloudflare(), // 3. Hook up the adapter
});
