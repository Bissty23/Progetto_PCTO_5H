const config = {
    user: "SA",
    password: "burbero2020",
    server:"127.0.0.1",
    database: "PCTO",
    options: {
        trustedconnection: true,
        trustserverCertificate: true,
        enableArithAbort: true,
        instancename:"MSSQLSERVER"
    },
    port: 1433
}

module.exports = config;