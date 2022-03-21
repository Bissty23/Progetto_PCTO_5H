const config = {
    user: "sa",
    password: "burbero2020",
    server:"localhost",
    database: "PCTO",
    options: {
        trustedconnection: true,
        trustServerCertificate: true,
        enableArithAbort: true,
        instancename:"MSSQLSERVER"
    },
    port: 1433
}

module.exports = config;