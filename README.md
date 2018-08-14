# rpi-ddns53

Docker image for Dynamic DNS on Route 53.

This is a fork of [nkmrtty/ddns53](https://github.com/nkmrtty/ddns53).

## Preliminary

Create a user (role) with the following IAM policy.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "route53:ChangeResourceRecordSets",
                "route53:ListResourceRecordSets"
            ],
            "Resource": "arn:aws:route53:::hostedzone/HOSTZONE_ID"
        }
    ]
}
```

## Usage

```bash
docker run \
  -e DDNS_ROUTE53_ZONE_ID=ABCDEFG123 \
  -e DDNS_ROUTE53_RECORD_SET=foo.bar.com \
  -e AWS_ACCESS_KEY_ID=HYJKLMN456 \
  -e AWS_SECRET_ACCESS_KEY=OPQRSTUVWZYZ7890 \
  nkmrtty/ddns53
```

### Environment Variable

* `DDNS_ROUTE53_ZONE_ID` : Hosted zone ID
* `DDNS_ROUTE53_RECORD_SET` : Record set name
* `DDNS_ROUTE53_TTL` (optional) : TTL
* `DDNS_ROUTE53_TYPE` (optional) : DNS record type
* `AWS_ACCESS_KEY_ID` : AWS access key ID
* `AWS_SECRET_ACCESS_KEY` : AWS secret access key

## Reference

* [mthssdrbrg/ddns-route53](https://github.com/mthssdrbrg/ddns-route53)
* [AWS Documentation : Configuring the AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)