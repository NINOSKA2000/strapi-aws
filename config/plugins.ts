module.exports = ({ env }) => ({
    upload: {
      config: {
        provider: 'cloudinary',
        providerOptions: {
          cloud_name: env('CLOUDINARY_NAME', 'diwel1yye'),
          api_key: env('CLOUDINARY_API_KEY', '124848985197925'),
          api_secret: env('CLOUDINARY_API_SECRET', 'oEJr17hGPL7XqlvKCBtjTqj-JF4'),
        },
        actionOptions: {
          upload: {},
          delete: {},
        },
      },
      cache: {
        enabled: true,
        maxAge: 60000, // Cache durante 60 segundos
      },
    },
  });
  