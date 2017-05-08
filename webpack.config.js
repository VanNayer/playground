var path = require('path');
module.exports = {
    entry: {
        rxgame: './index-rxgame',
        rxjs: './index-rxjs',
        react: './index-react'
    },

    output: {
        path: path.join(__dirname, 'public/assets/'),
        filename: '[name].bundle.js'
    },

    module: {
        // configuration regarding modules

        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
                query: {
                    presets: ['doctolib']
                }
            }
        ],

        /* Advanced module configuration (click to show) */
    },

    devtool: "source-map", // enum

}
