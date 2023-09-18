#---------------------------------------------------------#
#                 CPU Utilization                         # 
#---------------------------------------------------------#
resource "aws_cloudwatch_metric_alarm" "mysql-alarm" {
  alarm_name          = var.alarm_name 
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_period # Is the number of the most recent periods, or data points, to evaluate when determining alarm state.
  metric_name         = "CPUUtilization"      
  namespace           = "AWS/RDS"             
  period              = var.statistic_period  # After AWS Cloudwatch Alarm is triggered, it will wait for X seconds and then autoscales.
  statistic           = "Average"
  threshold           = var.metric_threshold #CPU Utilization threshold
  alarm_description   = "This metric monitors db cpu utilization"
  alarm_actions       = ["${aws_sns_topic.topic.arn}"]
  ok_actions          = ["${aws_sns_topic.topic.arn}"]

  dimensions = {
    DBInstanceIdentifier = var.DB_identifier_id #RDS Instance ID
  }
  tags = var.tags
}
#---------------------------------------------------------#
#         SNS topic creating and subscription             # 
#---------------------------------------------------------#
resource "aws_sns_topic" "topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.receving_notification_email
}
