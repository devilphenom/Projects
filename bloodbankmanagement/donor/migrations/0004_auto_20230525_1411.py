# Generated by Django 3.0.5 on 2023-05-25 08:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('donor', '0003_auto_20230525_1408'),
    ]

    operations = [
        migrations.AlterField(
            model_name='donor',
            name='address',
            field=models.CharField(max_length=100),
        ),
    ]